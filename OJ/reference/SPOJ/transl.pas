//Written on 6464 -- Jan 6, 2005
program transl;
const
  maxw=25;
var
  wor:array[1..2,-1..maxw]of string;
  graph:array[1..2,1..maxw,1..maxw]of boolean;
  indeg,outdeg:array[1..2,1..maxw]of byte;
  match:array[1..maxw]of byte;
  used:array[1..maxw]of boolean;
  n,words,h,i,p,x,y:longint;
  s:string;
  first,found,ok:boolean;
function find(s:string):byte;
  var
    i:byte;
  begin
    for i:=1 to words do
      if wor[h,i]=s then begin find:=i;exit;end;
    inc(words);wor[h,words]:=s;find:=words;
  end;
procedure search(x:byte);
  var
    y,i:byte;
  begin
    for y:=1 to words do begin
      if used[y] or (indeg[1,x]<>indeg[2,y]) or (outdeg[1,x]<>outdeg[2,y]) then continue;
      ok:=true;
      for i:=1 to x-1 do
        if (graph[1,x,i]<>graph[2,y,match[i]]) or (graph[1,i,x]<>graph[2,match[i],y]) then begin
          ok:=false;break;
        end;
      if ok then begin
        match[x]:=y;
        if x<words then begin
          used[y]:=true;search(x+1);if found then exit;used[y]:=false;
        end
        else begin
          found:=true;exit;
        end;
      end;
    end;
  end;
begin
  wor[1,-1]:=chr(255);first:=true;
  repeat
    readln(n);if n=0 then halt;
    fillchar(graph,sizeof(graph),0);
    fillchar(indeg,sizeof(indeg),0);
    fillchar(outdeg,sizeof(outdeg),0);
    for h:=1 to 2 do begin
      words:=0;
      for i:=1 to n do begin
        readln(s);
        p:=pos(' ',s);
        x:=find(copy(s,1,p-1));
        y:=find(copy(s,p+1,length(s)-p));
        graph[h,x,y]:=true;
        inc(outdeg[h,x]);inc(indeg[h,y]);
      end;
    end;

    fillchar(used,sizeof(used),0);
    found:=false;
    search(1);

    if first then first:=false else writeln;
    y:=0;
    for i:=1 to words do begin
      p:=y;y:=-1;
      for x:=1 to words do
        if (wor[1,x]>wor[1,p]) and (wor[1,x]<wor[1,y]) then y:=x;
      writeln(wor[1,y],'/',wor[2,match[y]]);
    end;
  until false;
end.
