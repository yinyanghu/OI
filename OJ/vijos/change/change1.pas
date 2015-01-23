program change;
var i,j,k,m,n,total,l,s:longint;
    c:char;
    p:string;
begin
    assign(input,'change1.in'); reset(input);
    assign(output,'change.out'); rewrite(output);
    readln(n);
    readln(p);
    readln(m);
    total:=0;
    l:=length(p);
    for i:=1 to l do begin
        if p[i] in ['0'..'9'] then k:=ord(p[i])-ord('0')
          else if p[i] in ['A'..'F'] then k:=ord(p[i])-55;
        total:=total*n+k;
    end;
    p:='';
    while total<>0 do begin
        s:=total mod m;
        if s in [0..9] then c:=chr(s+48) else
          case s of
              10:c:='A';
              11:c:='B';
              12:c:='C';
              13:c:='D';
              14:c:='E';
              15:c:='F';
          end;
        insert(c,p,1);
        total:=total div m;
    end;
    writeln(p);
    close(input);
    close(output);
end.
