program p0010;
var s:string;
    p:char;
    i,n:longint;

function ok(s:string; i:byte):byte;
 var t:byte;
 begin
      t:=1;
      repeat
          dec(i);
          if s[i]=')' then inc(t)
              else if s[i]='(' then dec(t);
     until t=0;
     ok:=i;
 end;

function find(s:string):byte;
 var i,k:byte;
 begin
     i:=length(s); k:=0;
     while i>0 do begin
         if (s[i]='+') or (s[i]='-') then begin
             find:=i;
             exit;
         end;
         if (k=0) and ((s[i]='*') or (s[i]='/')) then k:=i;
         if s[i]=')' then i:=ok(s,i);
         dec(i);
     end;
     find:=k;
 end;

function change(s:string; var p:char):string;
 var a,b:string;
     c1,c2:char;
     i:byte;
begin
    if length(s)=1 then begin
        change:=s;
        p:=' ';
        exit;
    end;
    if (s[length(s)]=')') and (ok(s,length(s))=1) then begin
        change:=change(copy(s,2,length(s)-2),p);
        exit;
    end;
    i:=find(s); p:=s[i];
    a:=change(copy(s,1,i-1),c1);
    b:=change(copy(s,i+1,length(s)-i),c2);
    if (p in ['*','-']) and (c2 in ['+','-']) then b:='('+b+')';
    if (p in ['*','/']) and (c1 in ['+','-']) then a:='('+a+')';
    if (p='/') and (c2<>' ') then b:='('+b+')';
    change:=a+p+b
end;

begin
     readln(n);
     for i:=1 to n do begin
        readln(s);
        p:=' ';
        writeln(change(s,p));
    end;
end.