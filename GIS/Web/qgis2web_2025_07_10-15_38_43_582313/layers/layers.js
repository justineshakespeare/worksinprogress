ol.proj.proj4.register(proj4);
//ol.proj.get("EPSG:5070").setExtent([-5764182.094223, -1046197.474678, 5400990.916156, 5436228.555406]);
var wms_layers = [];

var format_JOIN_MoT_GeoUSstate_Projected_0 = new ol.format.GeoJSON();
var features_JOIN_MoT_GeoUSstate_Projected_0 = format_JOIN_MoT_GeoUSstate_Projected_0.readFeatures(json_JOIN_MoT_GeoUSstate_Projected_0, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:5070'});
var jsonSource_JOIN_MoT_GeoUSstate_Projected_0 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_JOIN_MoT_GeoUSstate_Projected_0.addFeatures(features_JOIN_MoT_GeoUSstate_Projected_0);
var lyr_JOIN_MoT_GeoUSstate_Projected_0 = new ol.layer.Vector({
                declutter: false,
                source:jsonSource_JOIN_MoT_GeoUSstate_Projected_0, 
                style: style_JOIN_MoT_GeoUSstate_Projected_0,
                popuplayertitle: 'JOIN_MoT_GeoUSstate_Projected',
                interactive: true,
    title: 'JOIN_MoT_GeoUSstate_Projected<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_0.png" /> 2.3 - 4.7<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_1.png" /> 4.7 - 5.7<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_2.png" /> 5.7 - 7.1<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_3.png" /> 7.1 - 9.5<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_4.png" /> 9.5 - 12.3<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_5.png" /> 12.3 - 14.8<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_6.png" /> 14.8 - 17.9<br />\
    <img src="styles/legend/JOIN_MoT_GeoUSstate_Projected_0_7.png" /> 17.9 - 28.2<br />' });
var format_cb_2023_us_state_5m_projected_1 = new ol.format.GeoJSON();
var features_cb_2023_us_state_5m_projected_1 = format_cb_2023_us_state_5m_projected_1.readFeatures(json_cb_2023_us_state_5m_projected_1, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:5070'});
var jsonSource_cb_2023_us_state_5m_projected_1 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_cb_2023_us_state_5m_projected_1.addFeatures(features_cb_2023_us_state_5m_projected_1);
var lyr_cb_2023_us_state_5m_projected_1 = new ol.layer.Vector({
                declutter: false,
                source:jsonSource_cb_2023_us_state_5m_projected_1, 
                style: style_cb_2023_us_state_5m_projected_1,
                popuplayertitle: 'cb_2023_us_state_5m_projected',
                interactive: false,
                title: 'cb_2023_us_state_5m_projected'
            });

lyr_JOIN_MoT_GeoUSstate_Projected_0.setVisible(true);lyr_cb_2023_us_state_5m_projected_1.setVisible(true);
var layersList = [lyr_JOIN_MoT_GeoUSstate_Projected_0,lyr_cb_2023_us_state_5m_projected_1];
lyr_JOIN_MoT_GeoUSstate_Projected_0.set('fieldAliases', {'fid': 'fid', 'GEO_ID': 'GEO_ID', 'NAME.x': 'State', 'Year': 'Year', 'Total': 'Total', 'Total_forp': 'Total_forp', 'Total_nonp': 'Total_nonp', 'Total_loca': 'Total_loca', 'Total_stat': 'Total_stat', 'Total_fedG': 'Total_fedG', 'Total_self': 'Total_self', 'Total_Unpa': 'Total_Unpa', 'Total_Drov': 'Total_Drov', 'Total_Carp': 'Total_Carp', 'Total_Publ': 'Total_Publ', 'Total_Walk': 'Total_Walk', 'Total_CabB': 'Total_CabB', 'Total_Work': 'Total_Work', 'ForProfit_': 'ForProfit_', 'NonProfit_': 'NonProfit_', 'LocalGov_W': 'LocalGov_W', 'StateGov_W': 'StateGov_W', 'FedGov_WFH': 'FedGov_WFH', 'SelfEmpNot': 'SelfEmpNot', 'UnpaidFami': 'UnpaidFami', 'Total_AllG': 'Total_AllG', 'perc_AllGo': 'perc_AllGo', 'perc_Unpai': 'perc_Unpai', 'perc_ForPr': 'perc_ForPr', 'perc_NonPr': 'perc_NonPr', 'perc_WFH': 'perc_WFH', 'perc_Walk': 'perc_Walk', 'perc_PubTr': 'perc_PubTr', 'perc_Drove': 'perc_Drove', 'perc_Carpo': 'perc_Carpo', 'perc_WFH_A': 'perc_WFH_A', 'perc_WFH_F': 'perc_WFH_F', 'perc_WFH_N': 'perc_WFH_N', 'perc_WFH_S': 'perc_WFH_S', 'perc_WFH_U': 'perc_WFH_U', 'GEOIDFQ': 'GEOIDFQ', 'STATEFP': 'STATEFP', 'STATENS': 'STATENS', 'GEOID': 'GEOID', 'STUSPS': 'STUSPS', 'NAME.y': 'NAME.y', 'LSAD': 'LSAD', 'ALAND': 'ALAND', 'AWATER': 'AWATER', 'Year.manua': 'Year', });
lyr_cb_2023_us_state_5m_projected_1.set('fieldAliases', {'STATEFP': 'STATEFP', 'STATENS': 'STATENS', 'GEOIDFQ': 'GEOIDFQ', 'GEOID': 'GEOID', 'STUSPS': 'STUSPS', 'NAME': 'NAME', 'LSAD': 'LSAD', 'ALAND': 'ALAND', 'AWATER': 'AWATER', });
lyr_JOIN_MoT_GeoUSstate_Projected_0.set('fieldImages', {'fid': 'Hidden', 'GEO_ID': 'Hidden', 'NAME.x': 'TextEdit', 'Year': 'DateTime', 'Total': 'Hidden', 'Total_forp': 'Hidden', 'Total_nonp': 'Hidden', 'Total_loca': 'Hidden', 'Total_stat': 'Hidden', 'Total_fedG': 'Hidden', 'Total_self': 'Hidden', 'Total_Unpa': 'Hidden', 'Total_Drov': 'Hidden', 'Total_Carp': 'Hidden', 'Total_Publ': 'Hidden', 'Total_Walk': 'Hidden', 'Total_CabB': 'Hidden', 'Total_Work': 'Hidden', 'ForProfit_': 'Hidden', 'NonProfit_': 'Hidden', 'LocalGov_W': 'Hidden', 'StateGov_W': 'Hidden', 'FedGov_WFH': 'Hidden', 'SelfEmpNot': 'Hidden', 'UnpaidFami': 'Hidden', 'Total_AllG': 'Hidden', 'perc_AllGo': 'Hidden', 'perc_Unpai': 'Hidden', 'perc_ForPr': 'Hidden', 'perc_NonPr': 'Hidden', 'perc_WFH': 'TextEdit', 'perc_Walk': 'Hidden', 'perc_PubTr': 'Hidden', 'perc_Drove': 'Hidden', 'perc_Carpo': 'Hidden', 'perc_WFH_A': 'TextEdit', 'perc_WFH_F': 'TextEdit', 'perc_WFH_N': 'TextEdit', 'perc_WFH_S': 'TextEdit', 'perc_WFH_U': 'TextEdit', 'GEOIDFQ': 'Hidden', 'STATEFP': 'Hidden', 'STATENS': 'Hidden', 'GEOID': 'Hidden', 'STUSPS': 'Hidden', 'NAME.y': 'Hidden', 'LSAD': 'Hidden', 'ALAND': 'Hidden', 'AWATER': 'Hidden', 'Year.manua': 'TextEdit', });
lyr_cb_2023_us_state_5m_projected_1.set('fieldImages', {'STATEFP': 'TextEdit', 'STATENS': 'TextEdit', 'GEOIDFQ': 'TextEdit', 'GEOID': 'TextEdit', 'STUSPS': 'TextEdit', 'NAME': 'TextEdit', 'LSAD': 'TextEdit', 'ALAND': 'TextEdit', 'AWATER': 'TextEdit', });
lyr_JOIN_MoT_GeoUSstate_Projected_0.set('fieldLabels', {'NAME.x': 'inline label - visible with data', 'Year': 'inline label - visible with data', 'perc_WFH': 'inline label - visible with data', 'perc_WFH_A': 'inline label - visible with data', 'perc_WFH_F': 'inline label - visible with data', 'perc_WFH_N': 'inline label - visible with data', 'perc_WFH_S': 'inline label - visible with data', 'perc_WFH_U': 'inline label - visible with data', 'Year.manua': 'header label - visible with data', });
lyr_cb_2023_us_state_5m_projected_1.set('fieldLabels', {'STATEFP': 'no label', 'STATENS': 'no label', 'GEOIDFQ': 'no label', 'GEOID': 'no label', 'STUSPS': 'no label', 'NAME': 'no label', 'LSAD': 'no label', 'ALAND': 'no label', 'AWATER': 'no label', });
lyr_cb_2023_us_state_5m_projected_1.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});