program ural1307;
const
  maxtextlen=2000000;
  linelen=1400;
var
  text:array[1..maxtextlen]of char;
  ch:array[0..255]of byte;
  count:array[-1..255]of longint;
  code:array[0..255]of string;
  len:longint;
  b:ansistring;
procedure readtext;
  begin
    repeat
      inc(len);read(text[len]);
      inc(count[ord(text[len])]);
    until eof;
  end;
procedure cipher(s,t:byte);
  var
    i,p,x:longint;
  begin
    if s=t then exit;
    x:=count[s-1]+count[t];
    for i:=s to t do
      if count[i]*2>=x then begin
        if count[i]+count[i-1]>x then p:=i-1 else p:=i;
        break;
      end;
    for i:=s to p do code[ch[i]]:=code[ch[i]]+'0';
    for i:=p+1 to t do code[ch[i]]:=code[ch[i]]+'1';
    cipher(s,p);
    cipher(p+1,t);
  end;
procedure prepare;
  var
    i,j,t,maxcodelen:longint;
  begin
    for i:=0 to 255 do ch[i]:=i;
    for i:=0 to 254 do
      for j:=i+1 to 255 do
        if count[i]<count[j] then begin
          t:=ch[i];ch[i]:=ch[j];ch[j]:=t;
          t:=count[i];count[i]:=count[j];count[j]:=t;
        end;

    writeln('{PAS}');
    j:=255;while count[j]=0 do dec(j);
    for i:=1 to j do inc(count[i],count[i-1]);
    cipher(0,j);

    maxcodelen:=0;
    writeln('const l:longint=',len,';mc=',j,';');
    writeln('code:array[0..mc]of string=(');
    for i:=0 to j do begin
      write('''',code[ch[i]],'''');
      if length(code[ch[i]])>maxcodelen then maxcodelen:=length(code[ch[i]]);
      if i=j then break;
      write(',');
      if i mod 10=9 then writeln;
    end;
    writeln(');');
    writeln('ch:array[0..mc]of byte=(');
    for i:=0 to j do begin
      write(ch[i]);
      if i=j then break;
      write(',');
      if i mod 10=9 then writeln;
    end;
    writeln(');');
    writeln('ml=',maxcodelen,';');

    writeln('var b:ansistring;');
    writeln('procedure e;');
    writeln('var s,t,m:byte;');
    writeln('begin');
    writeln('s:=0;t:=mc;');
    writeln('repeat');
    writeln('m:=(s+t) shr 1;');
    writeln('if code[m]=copy(b,1,length(code[m])) then begin s:=m;break;end;');
    writeln('if code[m]>b then t:=m-1 else s:=m+1;');
    writeln('until s=t;');
    writeln('write(chr(ch[s]));');
    writeln('delete(b,1,length(code[s]));');
    writeln('dec(l);if l=0 then halt;');
    writeln('end;');
    writeln('procedure d(s:string);');
    writeln('var a,i,j:byte;t:string;');
    writeln('begin');
    writeln('for i:=1 to length(s) do begin');
    writeln('a:=ord(s[i])-40;t:='''';');
    writeln('for j:=1 to 7 do begin');
    writeln('if odd(a) then t:=''1''+t else t:=''0''+t;');
    writeln('a:=a shr 1;');
    writeln('end;');
    writeln('b:=b+t;');
    writeln('while length(b)>=ml do e;');
    writeln('end;');
    writeln('end;');
  end;
procedure out;
  var
    l,i,j:longint;
    a:byte;
  begin
    write('d(''');
    if length(b)>linelen then l:=linelen else l:=length(b);
    a:=0;
    for i:=1 to l do begin
      a:=a shl 1+ord(b[i]='1');
      if i mod 7=0 then begin write(chr(40+a));a:=0;end;
    end;
    writeln(''');');
    delete(b,1,l);
  end;
procedure compress;
  var
    i:longint;
  begin
    writeln('begin');
    for i:=1 to len do begin
      b:=b+code[ord(text[i])];
      if length(b)>=linelen then out;
    end;
    while length(b) mod 7>0 do b:=b+'0';
    if length(b)>0 then out;
    writeln('while l>0 do e;end.');
  end;
begin
//  assign(input,'1307.in');reset(input);
//  assign(output,'1307.out');rewrite(output);{won't work for special}
  readtext;
  prepare;
  compress;
//  close(input);close(output);
end.
