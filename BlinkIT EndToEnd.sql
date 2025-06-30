SELECT COUNT(*)
FROM BlinkIT_Data

SELECT * FROM BlinkIT_Data

--need to updae this col with the uniform value. convert lower cases to upper cases.

UPDATE BlinkIT_Data
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content = 'low fat' OR Item_Fat_Content = 'LF'


-- now we will update the other cols but with different approach, using case statements.

UPDATE BlinkIT_Data
SET Item_Fat_Content = 

CASE 
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content  = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

--lets check whether the values have been updated.

SELECT DISTINCT(Item_Fat_Content) FROM BlinkIT_Data









