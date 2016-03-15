app = proc do |env|
 [
   200,
   {
     'Content-Type' => 'text/html',
     'Content-Length' => '11'
   },
   ['Hello World']
 ]
end

run app

