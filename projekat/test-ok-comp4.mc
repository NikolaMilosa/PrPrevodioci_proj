//Testiranje kompleksnih mogucnosti:
//RETURN: 7
int main(){
	int a,b,c;
	int e,f = 3, g;
	
	para(a = 0 : 5 : paso 1){
		b = b + a;
		
		check[a]{
			when 1 -> 
				c = 3;
				finish;
			when 2 ->
				check[e]{
					when 1 ->
						check[c]{
							when 3 ->
								b = 0;
								finish;
							when 2 ->
								b = 2;
								finish;
						}
					when 0 ->
						{
							check[c]{
								when 3 ->
									b = 0;
									finish;
								when 2 ->
									b = 2;
									finish;
								}
							check[e]{
								when 2 ->
									b = 0;
								when 3 ->
									b = 2;
							}
						}
				}
		}
	}
	
	return b;
}
