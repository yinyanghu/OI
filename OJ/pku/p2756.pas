program p2756;
const maxlen=20000;
type bignumber=record
         w:array[1..maxlen] of longint;
	 len:longint;
	 flag:boolean;
     end;
var t:longint;
    a,b,c:bignumber;
procedure exchangea(l,r:longint);
 var k:longint;
 begin
     if (l>=r) then exit;
     k:=a.w[l]; a.w[l]:=a.w[r]; a.w[r]:=k;
     exchangea(l+1,r-1);
 end;

procedure exchangeb(l,r:longint);
 var k:longint;
 begin
     if (l>=r) then exit;
     k:=b.w[l]; b.w[l]:=b.w[r]; b.w[r]:=k;
     exchangeb(l+1,r-1);
 end;

procedure init;
 var ch:char;
 begin
     fillchar(a,sizeof(a),0);
     fillchar(b,sizeof(b),0);
     a.len:=0; a.flag:=true; b.flag:=true;
     while true do begin
         read(ch);
	 if (ch='-') then a.flag:=false;
	 if (ch=' ') then break;
	 if (ch in ['0'..'9']) then begin
             inc(a.len); a.w[a.len]:=ord(ch)-48;
         end;
     end;
     exchangea(1,a.len);
     b.len:=0;
     while not eoln do begin
         read(ch);
	 if (ch='-') then b.flag:=false;
	 if (ch=' ') then break;
         if (ch in ['0'..'9']) then begin
	     inc(b.len); b.w[b.len]:=ord(ch)-48;
         end;
     end;
     exchangeb(1,b.len);
     readln;
 end;

procedure add;
 var i,k:longint;
 begin
     fillchar(c,sizeof(c),0);
     k:=0;
     if a.len>b.len then c.len:=a.len else c.len:=b.len;
     for i:=1 to c.len do begin
         c.w[i]:=a.w[i]+b.w[i]+k;
	 k:=c.w[i] div 10;
	 c.w[i]:=c.w[i] mod 10;
     end;
     if k<>0 then begin
         inc(c.len);
	 c.w[c.len]:=k;
     end;
 end;

procedure minusab;
 var i,k:longint;
 begin
     fillchar(c,sizeof(c),0);
     c.len:=a.len; k:=0;
     for i:=1 to c.len do begin
         k:=a.w[i]-b.w[i]+k+10;
	 c.w[i]:=k mod 10;
	 k:=k div 10-1;
     end;
     if k<>0 then begin
         inc(c.len);
         c.w[c.len]:=k;
     end;
     while (c.w[c.len]=0) and (c.len>0) do dec(c.len);
 end;

procedure minusba;
 var i,k:longint;
 begin
     fillchar(c,sizeof(c),0);
     c.len:=b.len; k:=0;
     for i:=1 to c.len do begin
         k:=b.w[i]-a.w[i]+k+10;
	 c.w[i]:=k mod 10;
	 k:=k div 10-1;
     end;
     if k<>0 then begin
         inc(c.len);
         c.w[c.len]:=k;
     end;
     while (c.w[c.len]=0) and (c.len>0) do dec(c.len);
 end;


procedure print;
 var i:longint;
 begin
     if (c.len<>0) then begin
         for i:=c.len downto 1 do write(c.w[i])
     end else write(0);
     writeln;
 end;

procedure compareab;
 var k:longint;
 begin
     if a.len>b.len then exit;
     if a.len<b.len then begin
         write('-');
	 c:=a; a:=b; b:=c;
	 exit;
     end;
     k:=a.len;
     while (a.w[k]=b.w[k]) and (k>0) do dec(k);
     if b.w[k]>a.w[k] then begin
         write('-');
         c:=a; a:=b; b:=c;
     end;
 end;

procedure compareba;
 var k:longint;
 begin
     if b.len>a.len then exit;
     if b.len<a.len then begin
         write('-');
	 c:=a; a:=b; b:=c;
	 exit;
     end;
     k:=a.len;
     while (a.w[k]=b.w[k]) and (k>0) do dec(k);
     if a.w[k]>b.w[k] then begin
         write('-');
         c:=a; a:=b; b:=c;
     end;
 end;

procedure calc;
 begin
     if (a.flag) and (b.flag) then begin
         add;
         print;
         exit;
     end;
     if (not a.flag) and (not b.flag) then begin
         if (a.len=1) and (a.w[1]=0) and (b.len=1) and (b.w[1]=0) then begin
             writeln(0);
             exit;
         end;
         write('-');
	 add;
	 print;
         exit;
     end;
     if (a.flag) and (not b.flag) then begin
         compareab;
	 minusab;
	 print;
         exit;
     end;
     if (not a.flag) and (b.flag) then begin
         compareba;
	 minusba;
	 print;
         exit;
     end;
 end;

begin
    readln(t);
    while t>0 do begin
        dec(t);
	init;
	calc;
    end;
end.
