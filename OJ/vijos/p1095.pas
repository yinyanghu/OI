program p1095;
type arr=array[1..100] of longint;
var i,l,p,k:longint;
    s:string;
    n,m,temp,ans:arr;

procedure multiply(a:arr; var c:arr; var len:longint);
 var i,k:longint;
 begin
     fillchar(c,sizeof(c),0);
     k:=0; len:=p;
     for i:=1 to len do begin
         c[i]:=a[i]*2+k;
         k:=c[i] div 10;
       	 c[i]:=c[i] mod 10;
     end;
     if k<>0 then begin
         inc(len);
       	 c[len]:=k;
     end;
 end;

procedure minus(a:arr; b:arr; var c:arr);
 var i,k:longint;
 begin
     k:=0; fillchar(c,sizeof(c),0);
     for i:=1 to p do begin
         k:=a[i]-b[i]+k+10;
       	 c[i]:=k mod 10;
      	 k:=k div 10-1;
     end;
 end;

function check:boolean;
 var i:longint;
 begin
     if p>l then exit(true);
     for i:=l downto 1 do
       if temp[i]>n[i] then exit(true)
         else if temp[i]<n[i] then exit(false);
     writeln(1);
     halt;
 end;

begin
    readln(s);
    l:=length(s);
    for i:=1 to l do n[i]:=ord(s[l-i+1])-48;
    p:=1; fillchar(temp,sizeof(temp),0);
    temp[1]:=1;
    while (p<=l) and (not check) do begin
        m:=temp;
        multiply(m,temp,p);
    end;
    minus(n,m,ans);
    multiply(ans,ans,p);
    inc(ans[1]);
    k:=1;
    while ans[k]=10 do begin
        ans[k]:=0;
      	inc(k);
        inc(ans[k]);
    end;
    k:=p;
    while ans[k]=0 do dec(k);
    for i:=k downto 1 do write(ans[i]);
end.
