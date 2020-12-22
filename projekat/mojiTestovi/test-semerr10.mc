//Testiranje semantickih gresaka kod check iskaza

int main(){

	int a,b,c;
	unsigned e,f,g;
	
	check [a]{                     
		when 1u ->                    //nije isti tip kao a
			a = a + 5;
			finish;
		when 5 ->
			{
				b = 3;
			}
		when 5 ->                     //ponavlja se 5
			c = 3;
		otherwise ->
			c = a + b;
		}
		
	return 0;
	
}
