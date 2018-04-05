<?xml version="1.0"?>
<recipe>
    <#include "activity_layout_recipe.xml.ftl" />

    <instantiate from="src/app_package/classes/Activity.kt.ftl"
    to="${escapeXmlAttribute(srcOut)}/${className}Activity.kt" />

    <instantiate from="src/app_package/classes/ViewModelPaginated.kt.ftl"
    to="${escapeXmlAttribute(srcOut)}/${className}ViewModelPaginated.kt" />
      
    <instantiate from="src/app_package/classes/Adapter.kt.ftl"
    to="${escapeXmlAttribute(srcOut)}/${className}Adapter.kt" />
    
    <instantiate from="src/app_package/classes/Model.kt.ftl"
    to="${escapeXmlAttribute(srcOut)}/${className}.kt" />

    <instantiate from="src/app_package/classes/APIInteractor.kt.ftl"
    to="${escapeXmlAttribute(srcOut)}/${className}APIInteractor.kt" />

    <open file="${srcOut}/${className}Activity.kt"/>
</recipe>
