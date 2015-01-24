program migong;
uses crt;
const
   dx:array[1..5] of -1..1=(0,1,0,-1,0);
   dy:array[1..5] of -1..1=(-1,0,1,0,0);
   ch0='#';

var b:array[1..12,1..12] of byte;
    mi:array[1..12,1..12] of byte;
    sx,sy,sr:array[0..100] of integer;
    i,j:integer;
    st:string;

procedure waits(k:longint);
 var starttime,endtime:longint;
 begin
     starttime:=meml[seg0040:$006c];
     endtime:=meml[seg0040:$006c];
     while endtime-starttime<k do endtime:=meml[seg0040:$006c];
 end;

procedure init;
 begin
     clrscr;
     writeln('*****************************************************');
     writeln('Let"s play a game!!');
     waits(40);
     assign(input,'migong.in'); reset(input);
     for i:=1 to 12 do
       for j:=1 to 12 do read(mi[i,j]);
     close(input);
     for i:=1 to 12 do
       for j:=1 to 12 do begin
           b[i,j]:=mi[i,j];
           gotoxy(j,i);
           write(mi[i,j]);
       end;
 end;

procedure search(dp:byte);
 var x,y,p,r,nx,ny:integer;
     ch:char;
 begin
     p:=0;
     repeat
          r:=0;
          x:=sx[dp]; y:=sy[dp];
          repeat
               repeat
                    inc(r);
                    nx:=x+dx[r];
                    ny:=y+dy[r];
               until (r>4) or (b[ny,nx]=0);
               if r>4 then begin
                   b[y,x]:=1;
                   gotoxy(x,y);
                   write(ch0);
                   dec(dp);
                   x:=sx[dp]; y:=sy[dp];
                   r:=sr[dp];
                   if dp=0 then p:=3 else p:=0;
               end else begin
                   sr[dp]:=r;
                   inc(dp);
                   sx[dp]:=nx;
                   sy[dp]:=ny;
                   b[y,x]:=1;
                   p:=1;
                   gotoxy(x,y);
                   write('*');
                   if (nx=8) and (ny=11) then p:=2 else p:=1;
               end;
               waits(5);
          until p>0;
     until p>1;
     if p=2 then st:='goal' else st:='no path';
     gotoxy(1,19);
     write(st);
 end;

begin
    init;
    sx[1]:=9; sy[1]:=2;
    gotoxy(9,2);
    write('*');
    search(1);
    gotoxy(1,20);
    write('quit');
    waits(30);
end.
