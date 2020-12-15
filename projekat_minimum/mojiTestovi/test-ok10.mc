//Testiranje check iskaza

int main(){
	
	int a,b,c;
	unsigned e,f,g;
	
	check [a]{
		when 1 ->
			a = a + 5;
			finish;               //sa finish
		when 5 ->
			{
				b = 3;
			}                     //bez finish
		otherwise ->              //Sa otherwise
			a = a + b;
	}
	
	check [e]{
		when 2u ->
			f = f + 3u;
			finish;
		when 3u -> 
			{
				a = 5;
				b = 3;
			} finish;              //bez otherwise
	}
	
	check [a]{
		when 1 ->
			check[b]{
				when 1 ->
					b = 3;
			}
		when 1 ->
			b = 2;
			finish;
	}
	
	return 0;
}
