'
Demandé par Mélissa Boucher et Jessie Gonthier-Lajoie le 03/06/2024 via https://certifietech.jitbit.com/helpdesk/Ticket/73143469
Requête visant à valider de quels lots de séchoir les tags consommés dans une production de planeur donnée proviennent pour accélérer les validations si un paquet était jugé trop humide
Disponible dans l onglet Window du module Work Order ET dans le module Quick Answer List Master
'

SELECT         
    rwo_pitem.rwonum [PROD SECHOIR],
	udf_fields.udfinteger04 [LOT SECHOIR],
    tag_use.tagnum [TAG],
    rwo_hdr.startdate [DATE ENTREE],
    rwo_hdr.enddate [DATE SORTIE],
    tag_rec.product [PRODUIT],
    tag_rec.desc2 [LENGTH],
    tag_rec.desc3 [QTE PKG],
    tag_rec.desc4 [ATTRIB 4],
    tag_rec.desc5 [ATTRIB 5]   	

FROM tag_use 
	LEFT JOIN csm_tag ON tag_use.tagNum = csm_tag.tagNum
	LEFT JOIN rwo_pitem ON tag_use.docourrecid = rwo_pitem.ourrecid
	LEFT JOIN rwo_hdr ON rwo_pitem.rwonum = rwo_hdr.rwonum
    LEFT JOIN udf_fields ON rwo_hdr.udffieldskey = udf_fields.udffieldskey
	LEFT JOIN tag_rec ON tag_rec.tagnum = tag_use.tagnum   	

WHERE csm_tag.rwoNum = ^rwoNum^
               and udf_fields.udfinteger04 > 0
ORDER BY [TAG]