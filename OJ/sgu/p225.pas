program p225;
const
	ans:array[1..10,0..100] of int64
               =((1 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 4 , 6 , 4 , 1 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 9 , 28 , 36 , 18 , 2 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 16 , 96 , 276 , 412 , 340 , 170 , 48 , 6 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 25 , 252 , 1360 , 4436 , 9386 , 13384 , 12996 , 8526 , 3679 , 
                  994 , 158 , 15 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 36 , 550 , 4752 , 26133 , 97580 , 257318 , 491140 , 688946 , 716804 , 
                  556274 , 323476 , 141969 , 47684 , 12488 , 2560 , 393 , 40 , 2 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 49 , 1056 , 13340 , 111066 , 649476 , 2774728 , 8891854 , 21773953 , 41310504 , 
                  61412928 , 72304650 , 68233368 , 52400729 , 33376132 , 18001362 , 8363763 , 3374053 , 1178064 , 351592 , 
                  87913 , 17910 , 2858 , 336 , 26 , 1 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 64 , 1848 , 32084 , 376560 , 3184708 , 20202298 , 98796304 , 379978716 , 1167053680 , 
                  2897726604 , 5876860140 , 9825415557 , 13660238780 , 15932672964 , 15737653004 , 13304668385 , 9742722088 , 6260518246 , 3574590840 , 
                  1830733371 , 844203844 , 349524138 , 128874944 , 41833846 , 11792736 , 2840224 , 572432 , 93840 , 12004 , 
                  1122 , 68 , 2 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 81 , 3016 , 68796 , 1080942 , 12472084 , 110018552 , 762775440 , 4241252429 , 19206532478 , 
                  71707869632 , 222946143752 , 582155146204 , 1286247689414 , 2421159140764 , 3908273840366 , 5446391581062 , 6599640204257 , 7010436668992 , 6589213734278 , 
                  5537849837497 , 4207779106033 , 2920161348852 , 1865346129716 , 1101125592067 , 600730512987 , 302041066250 , 139345014744 , 58692638521 , 22451454400 , 
                  7755194754 , 2403337080 , 663103709 , 161373907 , 34237130 , 6238414 , 957145 , 120334 , 11914 , 872 , 
                  42 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0) , 
                 (1 , 100 , 4662 , 135040 , 2732909 , 41199404 , 481719518 , 4491423916 , 34075586550 , 213628255072 , 
                  1120204619108 , 4961681221524 , 18715619717199 , 60541371615660 , 168976761361446 , 409191804533576 , 864172675710439 , 1599730843649564 , 2609262108838924 , 3770687313420780 , 
                  4857550050070531 , 5616928666465104 , 5874943705896600 , 5604501518609804 , 4917655076255841 , 3999855946779732 , 3034690618677388 , 2156485957257040 , 1437827591264317 , 899278231344296 , 
                  526753407546620 , 288274613750624 , 146990556682887 , 69626509814580 , 30542906352994 , 12366448408056 , 4604442057431 , 1569983914256 , 487876545370 , 137395261280 , 
                  34831261750 , 7884855000 , 1578162590 , 275861904 , 41455966 , 5246412 , 543534 , 44244 , 2652 , 104 , 
                  2 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 
                  0));
var
	n,k:longint;
begin
	readln(n,k);
	writeln(ans[n,k]);
end.

{const
	maxn = 10;
	maxk = maxn * maxn;
var
	n,m,knight:longint;
	f:array[boolean,0..1 shl maxn - 1,0..1 shl maxn,0..maxk] of int64;
	state:array[0..1 shl maxn - 1] of longint;
procedure init;
 begin
 	readln(n,knight);
 	m:=1 shl n - 1;
 end;

procedure dfs(depth,curstate,count:longint);
 begin
 	if (depth = n + 1) then begin
 		state[curstate]:=count;
 		exit;
 	end;
 	dfs(depth + 1,curstate shl 1,count);
 	dfs(depth + 1,curstate shl 1 + 1,count + 1);
 end;

procedure main;
 var
 	i,j,k,s,p:longint;
 	flag:boolean;
 	ans:int64;
 begin
 	fillchar(state,sizeof(state),0);
 	dfs(1,0,0);
 	fillchar(f,sizeof(f),0);
 	flag:=true;
 	f[flag,0,0,0]:=1;
 	for i:=1 to n do begin
 		for j:=0 to m do
 			for k:=0 to m do
 				if ((j shl 2) and k = 0) and ((j shr 2) and k = 0) then
 					for s:=0 to m do
 						if ((j shl 2) and s = 0) and ((j shr 2) and s = 0) and ((k shl 1) and s = 0) and ((k shr 1) and s = 0) then begin
 							for p:=0 to knight do
 								if (p + state[s] <= knight) then f[not flag,s,j,p + state[s]]:=f[not flag,s,j,p + state[s]] + f[flag,j,k,p];
 						end;
 		fillchar(f[flag],sizeof(f[flag]),0);
 		flag:=not flag;
 	end;
 	ans:=0;
 	for i:=0 to m do
 		for j:=0 to m do ans:=ans + f[flag,i,j,knight];
 	writeln(ans);
 end;
	
begin
	init;
	main;
end.
}