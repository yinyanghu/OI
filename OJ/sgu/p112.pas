program p112;
type arr=array[1..500] of longint;
var a,b,i,k:longint;
    s1,s2,ans:arr;

procedure multiply(a:longint; var b:arr);
 var i,j,k:longint;
 begin
     k:=0;
     for i:=1 to 500 do begin
         b[i]:=b[i]*a+k;
         k:=b[i] div 10;
         b[i]:=b[i] mod 10;
     end;
 end;

procedure jian(a,b:arr; var c:arr);
 var i,j,k:longint;
 begin
     k:=0;
     for i:=1 to 500 do begin
         k:=a[i]-b[i]+10+k;
         c[i]:=k mod 10;
         k:=k div 10-1;
     end;
 end;

procedure check;
 var k,l1,l2:longint;
     p:arr;
     ok:boolean;
 begin
     l1:=500; l2:=500;
     ok:=false;
     while s1[l1]=0 do dec(l1);
     while s2[l2]=0 do dec(l2);
     if l1<l2 then ok:=true;
     if l1=l2 then begin
         k:=l1;
         while (s1[k]=s2[k]) and (k>0) do dec(k);
         if k=0 then begin
             write('0');
             halt;
         end;
         if (s1[k]<s2[k]) and (k<>0) then ok:=true;
     end;
     if ok then begin
         p:=s1; s1:=s2; s2:=p;
         write('-');
     end;
 end;

begin
    readln(a,b);
    if a=b then begin
        writeln('0');
        halt;
    end;
    s1[1]:=1; s2[1]:=1;
    for i:=1 to b do multiply(a,s1);
    for i:=1 to a do multiply(b,s2);
    check;
    jian(s1,s2,ans);
    k:=500;
    while (ans[k]=0) and (k>0) do dec(k);
    for i:=k downto 1 do write(ans[i]);
end.
