program loj_0001;
type arr=array[1..1000] of longint;
var p,s1,s2:string;
    a,b,c:arr;
    i,k,l1,l2,s:longint;
    b1,b2:boolean;

procedure add(a,b:arr; var c:arr);
 var i,j,k:longint;
 begin
     k:=0; fillchar(c,sizeof(c),0);
     for i:=1 to l1+l2 do begin
         c[i]:=a[i]+b[i]+k;
         k:=c[i] div 10;
         c[i]:=c[i] mod 10;
     end;
 end;

procedure jian(a,b:arr; var c:arr);
 var i,j,k:longint;
 begin
     i:=1; k:=0;
     fillchar(c,sizeof(c),0);
     while (i<=l1) do begin
         k:=a[i]-b[i]+10+k;
         c[i]:=k mod 10;
         k:=k div 10-1;
         inc(i);
     end;
 end;
begin
    readln(p); k:=pos(' ',p);
    b1:=false; b2:=false;
    s1:=copy(p,1,k-1); s2:=copy(p,k+1,length(p)-k+1);
    if s1[1] in ['-','+'] then begin
        if s1[1]='-' then b1:=true;
        s1:=copy(s1,2,length(s1)-1);
    end;
    if s2[1] in ['-','+'] then begin
        if s2[1]='-' then b2:=true;
        s2:=copy(s2,2,length(s2)-1);
    end;
    l1:=length(s1); l2:=length(s2);
    for i:=1 to l1 do a[i]:=ord(s1[l1-i+1])-48;
    for i:=1 to l2 do b[i]:=ord(s2[l2-i+1])-48;
    k:=l1+l2+20;
    if b1 and b2 then begin
       write('-');
       add(a,b,c);
       while c[k]=0 do dec(k);
       for i:=k downto 1 do write(c[i]);
    end else if b1 and (not b2) then begin
       if (l1<l2) or ((l1=l2) and (s1<s2)) then begin
           s:=l1; l1:=l2; l2:=s;
           c:=a; a:=b; b:=c;
       end else if s1<>s2 then write('-');
       fillchar(c,sizeof(c),0);
       jian(a,b,c);
       while (c[k]=0) and (k>0) do dec(k);
       if k=0 then write('0');
       for i:=k downto 1 do write(c[i]);
    end else if (not b1) and b2 then begin
        if (l1<l2) or ((l1=l2) and (s1<s2)) then begin
            write('-'); s:=l1; l1:=l2; l2:=s;
            c:=a; a:=b; b:=c;
        end;
        jian(a,b,c);
        while (c[k]=0) and (k>0) do dec(k);
        if k=0 then write('0');
        for i:=k downto 1 do write(c[i]);
    end else if (not b1) and (not b2) then begin
        add(a,b,c);
        while c[k]=0 do dec(k);
        for i:=k downto 1 do write(c[i]);
    end;
end.