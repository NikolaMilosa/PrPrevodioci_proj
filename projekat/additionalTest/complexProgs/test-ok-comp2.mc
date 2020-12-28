//Testiranje kompajlera na kompleksnijim programima :
//RETURN: 14

int main(){

	int a,b,c;
	unsigned e,f,g = 2u;
	
	check[e]{
		when 2u -> 
			para(a = 2 : 5 : paso 2){
				check[a]{
					when 2 ->
						b = 2;
					when 5 ->
						b = 3;
						finish;
					otherwise ->
						b = 4;
				}
			}
		otherwise ->
			para(a = 0 : 5 : paso 1){
				b = b + a;
			}
	}
	
	return b;
}
