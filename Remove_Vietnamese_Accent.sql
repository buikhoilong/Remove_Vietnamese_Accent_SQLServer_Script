CREATE FUNCTION Remove_Vietnamese_Accent(
 @string NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
-- Works in: SQL Server (starting with 2017)
-- Example: 'Ứng Tuyển Nhân Sự' --> 'Ung Tuyen Nhan Su'
-- By: Bùi Khởi Long

IF @string IS NULL RETURN @string
IF @string = '' RETURN @string

--Convert Normal Character
SET @string  = TRANSLATE(@string,N'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ','a|a|a|a|a|a|a|a|a|a|a|a|a|a|a|a|a')
SET @string  = TRANSLATE(@string,N'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ','o|o|o|o|o|o|o|o|o|o|o|o|o|o|o|o|o')
SET @string  = TRANSLATE(@string,N'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ','e|e|e|e|e|e|e|e|e|e|e')
SET @string  = TRANSLATE(@string,N'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ','u|u|u|u|u|u|u|u|u|u|u')
SET @string  = TRANSLATE(@string,N'ì|í|ị|ỉ|ĩ','i|i|i|i|i')
SET @string  = TRANSLATE(@string,N'ỳ|ý|ỵ|ỷ|ỹ','y|y|y|y|y')
SET @string  = REPLACE(@string,N'đ','d')

--Convert Capital Character
SET @string  = TRANSLATE(@string,N'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ','A|A|A|A|A|A|A|A|A|A|A|A|A|A|A|A|A')
SET @string  = TRANSLATE(@string,N'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ','O|O|O|O|O|O|O|O|O|O|O|O|O|O|O|O|O')
SET @string  = TRANSLATE(@string,N'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ','E|E|E|E|E|E|E|E|E|E|E')
SET @string  = TRANSLATE(@string,N'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ','U|U|U|U|U|U|U|U|U|U|U')
SET @string  = TRANSLATE(@string,N'Ì|Í|Ị|Ỉ|Ĩ','I|I|I|I|I')
SET @string  = TRANSLATE(@string,N'Ỳ|Ý|Ỵ|Ỷ|Ỹ','Y|Y|Y|Y|Y')
SET @string  = REPLACE(@string,N'Đ','D')

RETURN @string
END