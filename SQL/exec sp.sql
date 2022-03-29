use [ONIDO]

DECLARE @number		bigint
DECLARE	@posTmp		TABLE (num int) 
DECLARE @store		table (id bigint identity(1,1), num int)
DECLARE @result		VARCHAR(8000)
DECLARE my_cur
		CURSOR FOR 
		SELECT num 
		FROM @posTmp


insert into @posTmp exec dbo.QRHow
insert into dbo.QRlist select * from @posTmp

OPEN my_cur FETCH NEXT FROM my_cur INTO @number


WHILE @@FETCH_STATUS = 0
   BEGIN
   SET @result = CONCAT('{"what": "send","num": ', @number, '}')
    --�� ������ �������� ����� ��������� ���� �������� ��������� � ������� �����������   
    exec dbo.QRhttpRequest  @result
   --��������� ��������� ������ �������
   FETCH NEXT FROM my_cur INTO @number
   END
   
   --��������� ������
   CLOSE my_cur
   DEALLOCATE my_cur
   GO

