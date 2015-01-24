const maxn=20; maxm=maxn*2+1;

type Tlink=array[1..maxm] of integer;

var a:array[1..maxm,1..maxm] of boolean;
    link:Tlink;
    cover:array[1..maxm] of boolean;
    n,m,tot:integer;
    times:integer;
    ans:array[1..maxm] of Tlink;

procedure init;
  var i,j:integer;
      c:char;
  begin
    readln(n); m:=n*2+1;
    for i:=1 to m do
      begin
        for j:=1 to m do
          begin
            read(c);
            if c='+' then a[i,j]:=true else a[i,j]:=false;
          end;
        readln;
      end;

    tot:=0;
    for i:=1 to m do for j:=1 to m do if a[i,j] then inc(tot);
    times:=0;
  end;

function find(i:integer):boolean;
  var k,q:integer;
  begin
    for k:=1 to m do
      if a[i,k] and not cover[k] then
         begin
           q:=link[k]; link[k]:=i; cover[k]:=true;
           if (q=0) or find(q) then exit(true);
           link[k]:=q;
         end;
    exit(false);
  end;

function maxmatch:integer;
  var i,match:integer;
  begin
    fillchar(link,sizeof(link),0);
    for i:=1 to m do
      begin
        fillchar(cover,sizeof(cover),false);
        find(i);
      end;

    match:=0;
    for i:=1 to m do
      if link[i]<>0 then inc(match);
    exit(match);
  end;

procedure updata;
  var i,j:integer;
      used:Tlink;
  begin
    fillchar(used,sizeof(used),0);
    for i:=1 to m do if link[i]<>0 then used[link[i]]:=i;
    for i:=1 to m do if link[i]=0 then
      for j:=1 to m do if used[j]=0 then begin link[i]:=j; used[j]:=i; end;
    inc(times);
    ans[times]:=used;

    for j:=1 to m do
      begin
        i:=link[j];
        a[i,j]:=not a[i,j];
      end;
  end;

procedure work;
  var del:integer;
  begin
    repeat
      del:=maxmatch;
      if del<=n then break;
      dec(tot,del-(m-del));
      updata;
    until false;
  end;

procedure out;
  var i,j:integer;
  begin
    if tot>2*n then writeln('No solution')
    else begin
           writeln('There is solution:');
           for i:=1 to times do
             begin
               for j:=1 to m-1 do write(ans[i][j],' '); writeln(ans[i][m]);
             end;
         end;
  end;

begin
//assign(input,'1092.in'); reset(input);
  init;
  work;
  out;
end. 
