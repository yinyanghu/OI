program eightnumber;
type arrm=array[1..3,1..3] of 0..8;
     arrn=array[1..4] of -1..1;
     node=record
         ch:arrm;
         si,sj:1..3;
         p,dep:byte;
     end;
const di:arrn=(0,-1,0,1);
      dj:arrn=(-1,0,1,0);
var data:array[1..100] of node;
    goal,start:arrm;
    temp:node;
    r,k,ni,nj,head,tail,depth:integer;

procedure init;
 var i,j:integer;
 begin
     assign(input,'eightnumber.in'); reset(input);
     for i:=1 to 3 do
       for j:=1 to 3 do read(start[i,j]);
     for i:=1 to 3 do
       for j:=1 to 3 do read(goal[i,j]);
     close(input);
 end;

function check(k:integer):boolean;
 begin
     ni:=temp.si+di[k];
     nj:=temp.sj+dj[k];
     if (ni in [1..3]) and (nj in [1..3]) then check:=true else check:=false;
 end;

function dupe:boolean;
 var i,j,k:integer;
     buf:boolean;
 begin
     buf:=false; i:=0;
     repeat
        inc(i);
        buf:=true;
        for j:=1 to 3 do
          for k:=1 to 3 do
            if data[i].ch[j,k]<>data[tail].ch[j,k] then buf:=false;
     until buf or (i>=tail-1);
     dupe:=buf;
 end;

function goals:boolean;
 var i,j:integer;
 begin
     goals:=true;
     for i:=1 to 3 do
       for j:=1 to 3 do
         if data[tail].ch[i,j]<>goal[i,j] then goals:=false;
 end;

procedure print;
 var buf:array[1..100] of integer;
     i,j,k,n:integer;
 begin
     n:=1;
     i:=tail; buf[1]:=i;
     repeat
        inc(n);
        buf[n]:=data[i].p;
        i:=data[i].p;
     until i=0;
     writeln('step:',depth+1);
     for i:=1 to 3 do begin
         for k:=n-1 downto 1 do begin
             for j:=1 to 3 do write(data[buf[k]].ch[i,j]);
             if (i=2) and (k<>1) then write('--->')
               else write('    ');
         end;
         writeln;
     end;
     close(output);
     halt;
 end;

begin
    assign(output,'eightnumber.out'); rewrite(output);
    init;
    head:=0; tail:=1;
    with data[1] do begin
        ch:=start;
        si:=3;
        sj:=2;
        p:=0; dep:=0;
    end;
    repeat
      inc(head);
      temp:=data[head];
      depth:=temp.dep;
      for r:=1 to 4 do
        if check(r) then begin
            inc(tail); data[tail]:=temp;
            with data[tail] do begin
                ch[si,sj]:=ch[ni,nj];
                ch[ni,nj]:=0;
                si:=ni; sj:=nj;
                p:=head;
                dep:=depth+1;
            end;
            if dupe then dec(tail) else if goals then print
        end;
    until head>=tail;
    writeln('No Solution!');
    close(output);
end.