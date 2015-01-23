{$R-,S-,I-,Q-}
program build;
const maxlen=30;
var  m,len:byte;
     a:array[1..maxlen] of byte;
     f:array[0..9] of byte;
     g:array[0..9,0..9] of boolean;

procedure init;
var i,j,k:byte;
    st:string;
begin
    fillchar(g,sizeof(g),false);
    assign(input,'build.in'); reset(input);
    readln(st);
    len:=length(st);
    for i:=1 to len do a[i]:=ord(st[i])-ord('0');
    readln(m);
    for k:=1 to m do begin
        readln(i,j);
        g[i,j]:=true;
    end;
    close(input);
end;

procedure search;
var i,j,k:byte;
begin
    for k := 0 to 9 do
      for i := 0 to 9 do
        for j := 0 to 9 do
          g[i,j]:=g[i,j] or (g[i,k] and g[k,j]);

    for i:=0 to 9 do g[i,i]:=true;

    for i:=0 to 9 do
      for j:=0 to 9 do
        inc(f[i],ord(g[i,j]));
end;

procedure mul;
var i,j,k,jw:byte;
    ans:array[1..maxlen] of byte;
begin
    fillchar(ans,sizeof(ans),0);
    ans[1]:=1;
    for k:=1 to len do begin
        jw:=0;
        for i:= 1 to maxlen do begin
            ans[i]:=ans[i]*f[a[k]]+jw;
            jw:=ans[i] div 10;
            ans[i]:=ans[i] mod 10;
        end;
    end;
    j:=maxlen;
    while ans[j]=0 do dec(j);
    assign(output,'build.out'); rewrite(output);
    for i:=j downto 1 do write(ans[i]);
    writeln(output);
    close(output);
end;

begin
    init;
    search;
    mul;
end.
