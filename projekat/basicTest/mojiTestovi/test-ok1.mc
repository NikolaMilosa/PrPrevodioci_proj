//Testiranje parsera 
//RETURN: 6
int func(int a){
	a = 5;
	return a;
}
int main(){
	//testiranje identifikatora i tipovi int i unsigned
	
	int a;
	int b;
	unsigned c;
	unsigned d;
	
	//Dodela
	
	a = 5;
	b = 3;
	
	c = 2u;
	d = 5u;
	
	//testiranje operatora za sabiranje i oduzimanje
	
	a = a + b;
	c = c - d;
	
	//if else iskaz i relacioni operatori
	
	if(a > b)
		a = 3;
	else 
	 	b = 3;
	 	
	 if(c <= d)
	 	c = 4u;
	 	
	 /* Testiranje
	 višelinijskih 
	 komentara */
	 return a + b;
}	 
