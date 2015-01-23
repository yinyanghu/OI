program p1012;
{
**************************************
Make List!
**************************************
var n,m,k:longint;
    a:array[1..30] of longint;

function check:boolean;
 var s,i:longint;
 begin
     s:=1;
     for i:=n downto n-k+1 do begin
         s:=(s+m-2) mod i+1;
         if s<=k then exit(false);
     end;
     check:=true;
 end;

begin
    readln(k);
    m:=1; n:=2*k;
    while not check do inc(m);
    writeln(m);
end.
**************************************
Solution!
2,7,5,30,169,441,1872,7632,1740,93313,459901,1358657,2504881,13482720
**************************************
}
const ans:array[1..14] of longint=(2,7,5,30,169,441,1872,7632,1740,93313,459901,1358657,2504881,13482720);
var k:longint;
begin
    readln(k);
    while k<>0 do begin
        writeln(ans[k]);
        readln(k);
    end;
end.