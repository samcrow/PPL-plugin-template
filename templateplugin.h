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
