(*
将相邻的点染不同色，得两个颜色集P{ACFH} ，Q {BDEG}
因为每次要加上或减去不同色的点的数
所以两个颜色集的数和相等才有解
把能减去的边减去（即边AB A - Min(A, B), B - Min(A, B)）
因为某个X在集P内的点，与集Q有3个点相邻，
所以而不相邻的那个点是正方体对角线（以X为一端点）的另一点
最后肯定只剩余正方体对角线的两点有数，
在通过一个中间边，解决问题
下图是对角线AG一面的展开图
如A = G = X 则BF + X再AB - X, FG - X
A B C
- - - - - - -
| | |
- - - - - - -
E F G
*)
program Ural_1155(Input, Otuput);
type
    TIndex = Longint;
    TArr = array['A'..'H'] of TIndex;
var
    f: TArr;

procedure Print(St: string; Times: TIndex);
begin
    while Times > 0 do
    begin
        Dec(Times);
        Writeln(St);
    end;
end;

procedure Decl(Ch1, Ch2: Char);
var
    Min: TIndex;
begin
    if f[Ch1] < f[Ch2] then
        Min := f[Ch1]
    else
        Min := f[Ch2];
    Dec(f[Ch1], Min);
    Dec(f[Ch2], Min);
    Print(Ch1 + Ch2 + '-', Min);
end;

procedure Main;
var
    Ch: Char;
begin
    for Ch := 'A' to 'H' do
        Read(f[Ch]);
    if (f['A'] + f['C'] + f['F'] + f['H'])
        - (f['B'] + f['D'] + f['E'] + f['G']) <> 0 then
        Writeln('IMPOSSIBLE')
    else
    begin
        Decl('A', 'E');
        Decl('A', 'D');
        Decl('A', 'B');
        Decl('B', 'F');
        Decl('B', 'C');
        Decl('C', 'D');
        Decl('C', 'G');
        Decl('G', 'H');
        Decl('G', 'F');
        Decl('E', 'F');
        Decl('E', 'H');
        Decl('H', 'D');
        for Ch := 'A' to 'H' do
            if f[Ch] > 0 then
            begin
                if f['A'] + f['G'] > 0 then
                begin
                    Print('BF+', f['A']);
                    Print('AB-', f['A']);
                    Print('GF-', f['A']);
                end
                else if f['C'] + f['E'] > 0 then
                begin
                    Print('FB+', f['C']);
                    Print('EF-', f['C']);
                    Print('BC-', f['C']);
                end
                else if f['F'] + f['D'] > 0 then
                begin
                    Print('AE+', f['F']);
                    Print('EF-', f['F']);
                    Print('AD-', f['F']);
                end
                else if f['H'] + f['B'] > 0 then
                begin
                    Print('AE+', f['H']);
                    Print('HE-', f['H']);
                    Print('AB-', f['H']);
                end;
                Break;
            end;
    end;
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
   { Close(Input);
    Close(Output);  }
end.

