//Testiranje za slucaj vise num_exp
//RETURN: 33

int fun(int a){
	a = 5;
	return a;
}

int main(){

	int a,b,c;
	b = 5;
	a = 20;
	c = 1;
	
	b = (b++ + 5) + (20 + 0) + (c++ + 2);
	
	return b;
	
}
