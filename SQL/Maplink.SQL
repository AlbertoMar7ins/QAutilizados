-- Liberando expedições para poderem ser roteirizadas novamente por data.
UPDATE COF_PackingList_Line SET M_InOut_ID = null
WHERE
    M_InOut_ID IN (SELECT
    M_InOut.M_InOut_ID
FROM
    M_InOut
WHERE
    DATE_TRUNC('day',
    M_InOut.Created) >= $P{Created}
    AND M_InOut.COF_IsRoteirizado = 'Y');

UPDATE M_InOut SET COF_IsRoteirizado = 'N' WHERE M_InOut_ID IN (SELECT
    M_InOut.M_InOut_ID
FROM
    M_InOut
WHERE
    DATE_TRUNC('day',
    M_InOut.Created) >= $P{Created}
    AND M_InOut.COF_IsRoteirizado = 'Y');
--

-- Por ID
UPDATE M_InOut SET COF_IsRoteirizado = 'N' WHERE M_InOut_ID IN (SELECT
    COF_PackingList_Line.M_InOut_ID
FROM
    COF_PackingList_Line
WHERE
    COF_PackingList_ID = $P{IdLista});

UPDATE COF_PackingList_Line SET M_InOut_ID = null
WHERE COF_PackingList_ID = $P{IdLista};
--


-- Por Expedição
UPDATE M_InOut SET COF_IsRoteirizado = 'N' WHERE documentNo IN (

'1226503',
'1226509',
'1226554',
'1226685',
'1226691',
'1226721',
'1226750',
'1226794',
'1226869',
'1226879',
'1226905',
'1226914',
'1226920',
'1226946',
'1226977'
);


--
