using PubSub

function listener0()
    println("Function listener0")
end

function listener1(arg1)
    println("Function listener1 received:")
    println("   arg1: $arg1")
end

function listener2(args...)
    println("Function listener1 received:")
    println("   args: $args")
    println("multiple positional args")
end

function listener3(arg1; a=-1, b="")
    println("Function listener1 received:")
    println("   arg1: $arg1")
    println("   a: $a")
    println("   b: $b")
end

function listener4(args...; kwargs...)
    println("Function listener1 received:")
    println("   args: $args")
    println("   kwargs: $kwargs")
end

# ------------ register listener ------------------

println("Subscribe listeners to topic")
#subscribe(pub, listener0, "rootTopic")
#subscribe(pub, listener1, "rootTopic")
#subscribe(pub, listener2, "rootTopic")
subscribe(pub, listener3, "rootTopic")
#subscribe(pub, listener4, "rootTopic")

#---------------- send a message ------------------

println("Publish something via pubsub")
anObj = Dict(
    "a" => 456,
    "b" => "abc"
)

#sendMessage(pub, "rootTopic", 123, 456)

#sendMessage(pub, "rootTopic", 123; arg2=anObj)
sendMessage(pub, "rootTopic", 123; a=anObj["a"], b=anObj["b"])
