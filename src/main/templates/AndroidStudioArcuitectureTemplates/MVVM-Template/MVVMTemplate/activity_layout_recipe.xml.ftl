<recipe>

    <instantiate from="src/app_package/layout/activity_layout.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}_layout.xml" />

    <instantiate from="src/app_package/layout/cell_layout.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/cell_${activityLayoutName}_layout.xml" />

</recipe>
