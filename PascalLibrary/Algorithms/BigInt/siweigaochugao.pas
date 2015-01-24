program siweigaochugao;

const max=200;

type
   hp=record
       len:integer;
       s:array[1..max] of integer;
   end;

var x:array[1..2] of hp;
    y,w:hp;

procedure print(const p:hp);
 var i:integer;
 begin
     for i:=p.len downto 1 do write(p.s[i]);
 end;

procedure init;
 var st:string;
     i,j:integer;
 begin
    // assign(input,'hp.in'); reset(input);
     for i:=1 to 2 do begin
         readln(st);
         x[i].len:=length(st);
         for j:=1 to x[i].len do
           x[i].s[j]:=ord(st[x[i].len+1-j])-ord('0');
     end;
   //  close(input);
 end;

procedure subtract(a,b:hp;var c:hp);
 var i,len:integer;
 begin
     fillchar(c,sizeof(c),0);
     if a.len>b.len then len:=a.len else len:=b.len;
     for i:=1 to len do begin
         inc(c.s[i],a.s[i]-b.s[i]);
         if c.s[i]<0 then begin
             inc(c.s[i],10);
             dec(c.s[i+1]);
         end;
     end;
     while (len>1) and (c.s[len]=0) do dec(len);
     c.len:=len;
 end;

function compare(const a,b:hp):integer;
 var len:integer;
 begin
     if a.len>b.len then len:=a.len else len:=b.len;
     while (len>0) and (a.s[len]=b.s[len]) do dec(len);
     if len=0 then compare:=0 else compare:=a.s[len]-b.s[len];
 end;

procedure multiply10(var a:hp);
 var i:integer;
 begin
     for i:=a.len downto 1 do a.s[i+1]:=a.s[i];
     a.s[1]:=0;
     inc(a.len);
     while (a.len>1) and (a.s[a.len]=0) do dec(a.len);
 end;

procedure divide(a,b:hp;var c,d:hp);
 var i,j,len:integer;
 begin
     fillchar(c,sizeof(c),0);
     len:=a.len;
     fillchar(d,sizeof(d),0);
     d.len:=1;
     for i:=len downto 1 do begin
         multiply10(d);
         d.s[1]:=a.s[i];
         while (compare(d,b)>=0) do begin
             subtract(d,b,d);
             inc(c.s[i]);
         end;
     end;
     while (len>1) and (c.s[len]=0) do dec(len);
     c.len:=len;
 end;

procedure main;
 begin
     divide(x[1],x[2],y,w);
 end;

procedure out;
 begin
     //assign(output,'hp.out'); rewrite(output);
     writeln('Shang=');
     print(y);
     writeln;
     writeln('Yushu=');
     print(w);
     writeln;
     readln;
     //close(output);
 end;

begin
    init;
    main;
    out;
end.