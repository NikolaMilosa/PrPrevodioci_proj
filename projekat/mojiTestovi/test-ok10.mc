//Testiranje check iskaza
//RETURN: 11

int a,b;
int func(int c,int b){
	check[a]{
		when 3 ->
			a = 5;
		otherwise ->
			a = 4;
	}
	
	return a;
}

int main(){
	
	int a,b = 0,c;
	unsigned e,f,g;
	
	a = func(2 + 5 + 11,3);
	
	check [a]{
		when 1 ->
			b = a + 5;
				                 //sa finish
		when 4 ->
			{
				b = 3;
			}finish;              //bez finish
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
		when 4 ->
			check[b]{
				when 3 ->
					b = 5;
			}
		when 2 ->
			b = b + 2;
			finish;
	}
	
	return b + a;
}
