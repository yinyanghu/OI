#include <cstdio>
#include <cstring>
#include <cstdlib>

const	int		limitSize	= 1000000 + 10;

struct		Tnode
{
	int		left , right , father;
	int		key;
};

struct		Tsplay
{
	int		top;
	int		root;
	Tnode		tree	[limitSize];

	void	init()
	{
		root = 0; top = 0;
		tree[ 0 ].left = tree[ 0 ].right = tree[ 0 ].father = 0;
	}

	void	insert(int key)
	{
		tree[ ++ top ].key = key;
		tree[ top ].left = tree[ top ].right = 0;

		if (root == 0)
		{
			tree[ root = top ].father = 0;
			return ;
		}

		int	k , tk;

		k = root;
		while (k)
		{
			tk = k;
			if (key < tree[k].key) k = tree[k].left;
			else k = tree[k].right;
		}		
		
		tree[ top ].father = k = tk;

		if (key < tree[k].key) tree[ k ].left = top;
		else tree[ k ].right = top;

		splay( top );
	}

	void	splay(int x)
	{
		int	y , z;
		while (tree[x].father)
		{
			y = tree[x].father;
			z = tree[y].father;

			if (z == 0)
			{
				if (x == tree[y].left)
					rightRotate( x );
				else	leftRotate( x );
			}
			else 
			{
				if (x == tree[y].left)
				{
					if (y == tree[z].left)
					{
						rightRotate( y );
						rightRotate( x );
					} else {
						rightRotate( x );
						leftRotate( x );
					}
				}
				else {
					if (y == tree[z].left)
					{
						leftRotate( x );
						rightRotate( x );
					} else {
						leftRotate( y );
						leftRotate( x );
					}
				}
			}
		}
		root = x;
	}

	void	leftRotate(int x)
	{
		int	y = tree[x].father;
		int	z = tree[x].left;

		if (y == tree[ tree[y].father ].left )
			tree[ tree[y].father ].left = x;
		else	tree[ tree[y].father ].right = x;

		tree[x].father = tree[y].father; tree[x].left = y;
		tree[y].right = z; tree[y].father = x;
		tree[z].father = y;

		renewInfo( y );
		renewInfo( x );
	}

	void	rightRotate(int x)
	{
		int	y = tree[x].father;
		int	z = tree[x].right;

		if (y == tree[ tree[y].father ].left )
			tree[ tree[y].father ].left = x;
		else	tree[ tree[y].father ].right = x;

		tree[x].father = tree[y].father; tree[x].right = y;
		tree[y].left = z; tree[y].father = x;
		tree[z].father = y;

		renewInfo(y);
		renewInfo(x);
	}

	void	renewInfo(int x)
	{
	}

	int	getSmallest()
	{
		int	k = root;
		while (tree[k].left) k = tree[k].left;
		splay ( k );
		return tree[ k ].key;
	}

	void	eraseSmallest()
	{
		root = tree[ root ].right;
		tree[ root ].father = 0;
	}
};

