#include <cstdio>
#include <cstring>
using namespace std;
#define infinity 1000000000
#define limitsize 1000
struct TreeNode
{
	int left, right, father;
	int count;
	int key;
};
struct Tsplay
{
	int root, top;
	TreeNode tree[limitsize];
	
	void initialize()
	{
		root = top = 0;
		memset(tree, 0, sizeof(tree));
	}
	
	void left_rotate(int x)
	{
		int y = tree[x].father, z = tree[x].left;
		if (y == tree[tree[y].father].left)
			tree[tree[y].father].left = x;
		else
			tree[tree[y].father].right = x;
		tree[x].father = tree[y].father;
		tree[x].left = y;
		tree[y].right = z;
		tree[y].father = x;
		tree[z].father = y;
	}
	
	void right_rotate(int x)
	{
		int y = tree[x].father, z = tree[x].right;
		if (y == tree[tree[y].father].left)
			tree[tree[y].father].left = x;
		else
			tree[tree[y].father].right = x;
		tree[x].father = tree[y].father;
		tree[x].right = y;
		tree[y].left = z;
		tree[y].father = x;
		tree[z].father = y;
	}
	
	void splay(int x)
	{
		while (tree[x].father)
		{
			int y = tree[x].father, z = tree[y].father;
			if (z == 0)
			{
				if (x == tree[y].left)
					right_rotate(x);
				else
					left_rotate(x);
			}
			else
			{
				if (x == tree[y].left)
				{
					if (y == tree[z].left)
					{
						right_rotate(y);
						right_rotate(x);
					}
					else
					{
						right_rotate(x);
						left_rotate(x);
					}
				}
				else
				{
					if (y == tree[z].left)
					{
						left_rotate(x);
						right_rotate(x);
					}
					else
					{
						left_rotate(y);
						left_rotate(x);
					}
				}
			}
			
		}
		root = x;
	}
	
	int find(int x, int key)
	{
		while (tree[x].key != key)
			if (key < tree[x].key)
			{
				if (tree[x].left == 0) break;
				x = tree[x].left;
			}
			else
			{
				if (tree[x].right == 0) break;
				x = tree[x].right;
			}
		return x;
	}

	int maximum(int x)
	{
		splay(find(x, infinity));
		return root;
	}
	
	int minimum(int x)
	{
		splay(find(x, -infinity));
		return root;
	}
	
	int maximum_key(int x)
	{
		return tree[maximum(x)].key;
	}
	
	int minimum_key(int x)
	{
		return tree[minimum(x)].key;
	}
	
	int join(int x1, int x2)
	{
		if (x1 == 0) return x2;
		if (x2 == 0) return x1;
		int x = maximum(x1);
		tree[x].right = x2; tree[x2].father = x;
		return root;
	}	

	void split(int x, int& x1, int& x2)
	{
		splay(x);
		tree[x1 = tree[x].left].father = 0; tree[root].left = 0;
		tree[x2 = tree[x].right].father = 0; tree[root].right = 0;
	}
	
	void insert(int key)
	{
		tree[++ top].key = key; tree[top].count = 1;
		tree[top].left = tree[top].right = tree[top].father = 0;
		if (root == 0)
		{
			tree[root = top].father = 0;
			return;
		}
		splay(find(root, key));
		if (tree[root].key == key)
		{
			++ tree[root].count;
			return;
		}
		if (key < tree[root].key)
		{
			tree[top].left = tree[root].left;
			if (tree[top].left != 0)
				tree[tree[top].left].father = top;
			tree[root].left = 0;
			tree[top].right = root;
		}
		else
		{
			tree[top].right = tree[root].right;
			if (tree[top].right != 0)
				tree[tree[top].right].father = top;
			tree[root].right = 0;
			tree[top].left = root;
		}
		tree[root].father = top;
		root = top;
	}
	
	void erase(int key)
	{
		int x = find(root, key);
		if (key != tree[x].key) return;
		if (tree[x].count > 1)
		{
			-- tree[x].count;
			return;
		}
		int s1, s2;
		split(x, s1, s2);
		root = join(s1, s2);
	}
	int prev(int key)
	{
		int p = find(root, key);
		splay(p);
		if (tree[p].left == 0) return tree[p].key;
		p = tree[p].left;
		return tree[maximum(p)].key;
	}
	
	int succ(int key)
	{
		int p = find(root, key);
		splay(p);
		if (tree[p].right == 0) return tree[p].key;
		p = tree[p].right;
		return tree[minimum(p)].key;
	}
	
	bool exist(int key)
	{
		return (tree[find(root, key)].key == key);
	}
};

int main()
{
	return 0;
}
