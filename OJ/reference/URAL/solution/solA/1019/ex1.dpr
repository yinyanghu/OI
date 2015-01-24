(*
(1) l<=x.l & x.r<=r
  l  |__________| r
  x.l  |____| x.r
colour same or different, delete x
(2) l<=x.l & x.l<=r<x.r ("=" in "x.l<=r" !!!! when same colour merge)
  l  |_____| r
  x.l  |_______| x.r
colour same, r=x.r & delete x
different, x.l=r
(3) x.r<=r & x.l<l<=x.r ("=" in "l<=x.r" !!!! when same colour merge)
      l  |________| r
  x.l  |____| x.r
colour same, l=x.l & delete x
different, x.r=l
(4) x.l<l<x.r & x.l<r<x.r
      l  |______| r  --cur
  x.l  |______________| x.r
       |_|______|_new_| 
colour same, delete cur
different{
  new.l=r new.r=x.r new.c=x.c
  x.r=l
}
*)
(*
used time : 1.567s 
O(N^2+N)+O(N)=O(N^2)
*)
program Ural_1019(Input, Output);
const
    MaxN = 5000;
type
    TIndex = Longint;
    TSegment = record
        l, r: TIndex;
        c: Boolean;   //colour  false : white ,true : black
        d: Boolean;   //if deleted
    end;
    TSegmentSet = array[1..MaxN * 2] of TSegment;
var
    S: TSegmentSet;
    Len: TIndex;
    N: TIndex;

procedure Main;
var
    i, j: TIndex;
    Ch: Char;
    Len_, Ind, MaxLen, MinLeft: TIndex;
    IfNew: Boolean;    //ural judge is freepascal , so  "New" in FP is Highlight key => Compilation Error 1 times
begin
    FillChar(S, SizeOf(S), 0);
    Len := 1;
    S[1].l := 0;
    S[1].r := 1000000000;
    S[1].c := false;
    S[1].d := false;
    Readln(N);
    for i := 1 to N do
    begin
        Inc(Len);
        Read(S[Len].l, S[Len].r);
        repeat
            Read(Ch);
        until Ch in ['b', 'w'];
        Readln;
        S[Len].c := (Ch = 'b');
        S[Len].d := false;
        IfNew := false;
        for j := 1 to Len - 1 do
            if S[Len].r = S[Len].l then     //l=r
            begin
                S[Len].d := true;
                Break;
            end
            else if (S[Len].l <= S[j].l) and (S[j].r <= S[Len].r) then
                S[j].d := true
            else if (S[Len].l <= S[j].l) and (S[j].l <= S[Len].r) and (S[Len].r < S[j].r) then
            begin
                if S[Len].c = S[j].c then
                begin
                    S[Len].r := S[j].r;
                    S[j].d := true;
                end
                else
                    S[j].l := S[Len].r;
            end
            else if (S[j].r <= S[Len].r) and (S[j].l < S[Len].l) and (S[Len].l <= S[j].r) then
            begin
                if S[Len].c = S[j].c then
                begin
                    S[Len].l := S[j].l;
                    S[j].d := true;
                end
                else
                    S[j].r := S[Len].l;
            end
            else if (S[j].l < S[Len].l) and (S[Len].l < S[j].r) and (S[j].l < S[Len].r) and (S[Len].r < S[j].r) then
            begin
                if S[Len].c = S[j].c then
                    S[Len].d := true
                else
                begin
                    S[Len + 1].l := S[Len].r;
                    S[Len + 1].r := S[j].r;
                    S[Len + 1].c := S[j].c;
                    S[Len + 1].d := false;
                    S[j].r := S[Len].l;
                    IfNew := true;
                end;
                Break;
            end;
        //compact set list,namely fill deleted item
        Inc(Len, Ord(IfNew));
        Len_ := Len;
        Len := 0;
        j := 0;
        while j < Len_ do
        begin
            Inc(j);
            while S[j].d and (j <= Len_) do
                Inc(j);
            if j <= Len_ then
            begin
                Inc(Len);
                S[Len] := S[j];
            end;
        end;
    end;
    MaxLen := 0;
    MinLeft := MaxLongint;
    Ind := 0;
    for i := 1 to Len do
        if not S[i].c then
            if (S[i].r - S[i].l > MaxLen) or ((S[i].r - S[i].l = MaxLen) and (S[i].l < MinLeft)) then
            begin
                MaxLen := S[i].r - S[i].l;
                MinLeft := S[i].l;
                Ind := i;
            end;
    Writeln(S[Ind].l, ' ', S[Ind].r);
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
    {   Close(Input);
       Close(Output);       }
end.

