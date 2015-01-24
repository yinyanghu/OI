#include<stdio.h>
#include<mem.h>
#include<string.h>
#include<math.h>
long i,j,k,n,t,b[10000],s;
struct node
{
	long num,l,r,m,tot;
	node *left,*right;
};
int buildtree(node *p)
{
	p->m=(p->l+p->r) /2;
	if (p->l==p->r-1) 
	{
		p->tot=0;
		p->num=b[p->l];
		return 0;
	}	
    node *q1,*q2;
    q1=new node;
    p->left=q1;
    q1->l=p->l;
    q1->r=p->m;
    q1->tot=0;
    buildtree(q1);
    q2=new node;
    p->right=q2;
    q2->l=p->m;
    q2->r=p->r;
    q2->tot=0;
    buildtree(q2);
    if (p->num==0) p->num=p->left->num+p->right->num;
	return 0;
}
int passmark(node *p)
{
	p->left->tot+=p->tot;
	p->right->tot+=p->tot;
	p->left->num+=(p->left->r-p->left->l)*p->tot;
	p->right->num+=(p->right->r-p->right->l)*p->tot;
	p->tot=0;
	return 0;
}
int find(node *p,long i,long j)
{
	if ((p->l==i) && (p->r==j+1))
	{
		s+=p->num;
		return 0;
	}
	if (p->tot!=0) passmark(p);
	if (p->m>=j+1) find(p->left,i,j);
	if (p->m<=i) find(p->right,i,j);
	if ((p->m>i) && (p->m<j+1))
	{
		find(p->left,i,p->m-1);
		find(p->right,p->m,j);
	}
	return 0;
}
int add(node *p,long i,long j,long k)
{
	if ((p->l==i) && (p->r==j+1))
	{
		p->tot+=k;
		p->num+=(p->r-p->l)*k;
		return 0;
	}
	if (p->m>=j+1) add(p->left,i,j,k);
	if (p->m<=i) add(p->right,i,j,k);
	if ((p->m>i) && (p->m<j+1))
	{
		add(p->left,i,p->m-1,k);
		add(p->right,p->m,j,k);		
	}
	p->num=p->left->num+p->right->num;
	return 0;
}
int main()
{		
	freopen("xxx.in","r",stdin);
	freopen("xxx.out","w",stdout);
	scanf("%ld",&n);
	for (i=0;i<n;i++)
	scanf("%ld",&b[i+1]);
	node *root;
	root=new node;	
	root->l=1;
	root->r=n+1;
	root->tot=0;
	buildtree(root);	
	add(root,2,6,2);	
	s=0;
	find(root,4,6);	
	printf("%ld",s);	
	return 0;
}
