'
Requête demandée par Mylène Fortin le 12/11/2024 via https://certifietech.jitbit.com/helpdesk/Ticket/79136089
Objectif:  Valider les lots de séchoir desquels les tags disponibles en inventaire pour un produit donné proviennent afin d améliorer la rotation de l inventaire (Available)
Disponible dans l onglet Window du module Inventory Browse de LumberTrack ET dans le module Quick Answer List Master
' 

SELECT         
    udf_fields.udfinteger04 AS [LOT SECHOIR],
    rwo_hdr.enddate AS [DATE SORTIE],
    tag_use.tagnum AS [TAG],
    tag_rec.product AS [PRODUIT],
    tag_rec.desc2 AS [LENGTH],
    tag_rec.desc3 AS [QTE PKG],
    tag_rec.desc4 AS [ATTRIB 4],
    tag_rec.desc5 AS [ATTRIB 5]
	
FROM tag_rec 
    LEFT JOIN tag_use ON tag_rec.tagNum = tag_use.tagNum
    LEFT JOIN rwo_pitem ON tag_use.docourrecid = rwo_pitem.ourrecid
    LEFT JOIN rwo_hdr ON rwo_pitem.rwonum = rwo_hdr.rwonum
    LEFT JOIN udf_fields ON rwo_hdr.udffieldskey = udf_fields.udffieldskey 	
WHERE tag_rec.tagstatus = 'A' 
    AND tag_rec.product = ^product^ 
    AND tag_rec.desc2 = ^desc2^
	AND tag_rec.loc = ^loc^
    AND udf_fields.udfinteger04 > 0
ORDER BY [DATE SORTIE]
