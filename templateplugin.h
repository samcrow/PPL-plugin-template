
// To the extent possible under law, the author has waived all
// copyright and related or neighboring rights to this work.

#ifndef TEMPLATEPLUGIN_H
#define TEMPLATEPLUGIN_H
#include "plugin-interface/plugin.h"

class TemplatePlugin : public Plugin
{
public:
    TemplatePlugin();

    virtual ~TemplatePlugin();

    virtual void onDisable() override;
    virtual void onEnable() override;
};

#endif // TEMPLATEPLUGIN_H
