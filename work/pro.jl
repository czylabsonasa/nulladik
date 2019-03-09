  function F(x)
    arr=zeros(Int,10)
    function add()
      arr .+= x
      println(arr)
    end
    return add
  end
