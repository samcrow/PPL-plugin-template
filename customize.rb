#!/usr/bin/env ruby
require 'tempfile'
require 'fileutils'

=begin

Renames a plugin from the default name to a new name, for initial plugin setup

Usage: customize.rb NewName
Renames TemplatePlugin class to NewNamePlugin
Renames Template.pro to NewName.pro

=end


#
# Performes one or more replacements, using gsub, on the file.
# Rewrites the file with the replaced content.
#
# Replacements should be a hash with :pattern corresponding to a
# regular expression or string to search for, and :replacement
# corresponding to a string to insert as a replacement.
# It can also be an array of those hashes.
#
def replaceAll(fileName, replacements)
    if replacements.is_a? Array

        originalFile = File.open fileName, File::RDONLY
        tempFile = Tempfile.new fileName

        originalFile.each_line do | line |
            replacedLine = line
            replacements.each do | replacement |
                replacedLine.gsub! replacement[:pattern], replacement[:replacement]
            end
            tempFile.write replacedLine
        end

        tempFile.close
        originalFile.close

        # Overwrite the original file
        FileUtils.move tempFile.path, originalFile.path, :force => true

    else
        # Just one replacement. Wrap it in an array and recurse.
        replaceAll(fileName, [ replacements ])
    end
end

# Creates a hash of names for a class
def makeNamesForClass(className)
    return {
        header: className.downcase + '.h',
        source: className.downcase + '.cpp',
        includeGuard: className.upcase + '_H'
    }
end

ORIGINAL_PLUGIN_NAME = 'Template'
ORIGINAL_CLASS_NAME = ORIGINAL_PLUGIN_NAME + 'Plugin'

NEW_PLUGIN_NAME = ARGV[0]
if ! NEW_PLUGIN_NAME
    puts "Please provide a name for the plugin"
    exit -4
end

NEW_CLASS_NAME = NEW_PLUGIN_NAME + 'Plugin'

ORIGINAL_PROJECT_FILE = ORIGINAL_PLUGIN_NAME + '.pro'
NEW_PROJECT_FILE = NEW_PLUGIN_NAME + '.pro'

originalClass = makeNamesForClass(ORIGINAL_CLASS_NAME)
newClass = makeNamesForClass(NEW_CLASS_NAME)

sourceFileReplacements = [
    { pattern: ORIGINAL_CLASS_NAME,          replacement: NEW_CLASS_NAME },
    { pattern: originalClass[:includeGuard], replacement: newClass[:includeGuard] },
    { pattern: originalClass[:header],       replacement: newClass[:header] }
]

projectFileReplacements = [
    { pattern: originalClass[:header],       replacement: newClass[:header] },
    { pattern: originalClass[:source],       replacement: newClass[:source] }
]

# Replace contents of files
replaceAll(ORIGINAL_PROJECT_FILE, projectFileReplacements)
replaceAll(originalClass[:header], sourceFileReplacements)
replaceAll(originalClass[:source], sourceFileReplacements)

# Rename files
FileUtils.move ORIGINAL_PROJECT_FILE, NEW_PROJECT_FILE
FileUtils.move originalClass[:header], newClass[:header]
FileUtils.move originalClass[:source], newClass[:source]
