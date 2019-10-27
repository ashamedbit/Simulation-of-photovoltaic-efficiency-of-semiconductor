function [temp1,list,list1]= binsearchdatatable(sortedarray,key)
high=length(sortedarray);
low=1;

key=char(key);
list=[];
list1=[];
temp1=0;
mid=0;

while(high>=low)
 
    if mod((high + low),2) ==0
       mid=(high+low)/2;
   else
       mid=(high+low-1)/2;
    end
   
    
        
        if sortedarray(mid)==key
            temp1=mid;
            list=mid;
            list1=mid;
            return
        end
        
         if sortedarray(mid)>key
           
        high=mid-1;
         end
         
         if sortedarray(mid)<key
          
             low=mid+1;
         end
    
end

if(sortedarray(mid)>key)
   list=mid-1;
   list1=mid;
else
    list=mid;
   list1=mid+1;
end
 
 

end