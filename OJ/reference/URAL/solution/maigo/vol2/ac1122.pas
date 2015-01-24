program ural1122;
var
  m:array[1..3]of byte;
  move:array[1..16]of word;
  q:array[1..65535]of word;
  step:array[1..65535]of byte;
  v:array[0..65535]of boolean;
  front,rear,t:word;
  c:char;
  i,j:byte;
begin
  q[1]:=0;
  for i:=1 to 4 do begin
    for j:=1 to 4 do begin
      read(c);
      q[1]:=q[1] shl 1+ord(c='B');
    end;
    readln;
  end;
  if (q[1]=0) or (q[1]=65535) then begin
    writeln(0);
    halt;
  end;

  for i:=1 to 3 do begin
    m[i]:=0;
    for j:=1 to 3 do begin
      read(c);
      m[i]:=m[i] shl 1+ord(c='1');
    end;
    readln;
  end;

  move[10]:=(m[1] shl 1)*256+(m[2] shl 1)*16+m[3] shl 1;
  move[11]:=m[1]*256+m[2]*16+m[3];
  move[12]:=(m[1] shr 1)*256+(m[2] shr 1)*16+m[3] shr 1;
  m[1]:=m[1] shl 2 mod 16;m[2]:=m[2] shl 2 mod 16;m[3]:=m[3] shl 2 mod 16;
  move[9]:=m[1]*256+m[2]*16+m[3];
  move[1]:=move[9] mod 256 shl 8;move[2]:=move[10] mod 256 shl 8;
  move[3]:=move[11] mod 256 shl 8;move[4]:=move[12] mod 256 shl 8;
  move[5]:=move[9] shl 4;move[6]:=move[10] shl 4;
  move[7]:=move[11] shl 4;move[8]:=move[12] shl 4;
  move[13]:=move[9] shr 4;move[14]:=move[10] shr 4;
  move[15]:=move[11] shr 4;move[16]:=move[12] shr 4;

  fillchar(v,sizeof(v),0);
  front:=0;rear:=1;step[1]:=0;v[q[1]]:=true;
  repeat
    inc(front);
    for i:=1 to 16 do begin
      t:=q[front] xor move[i];
      if not v[t] then begin
        inc(rear);
        q[rear]:=t;
        step[rear]:=succ(step[front]);
        v[t]:=true;
        if (t=0) or (t=65535) then begin
          writeln(step[rear]);
          halt;
        end;
      end;
    end;
  until front=rear;

  writeln('Impossible');
end.
