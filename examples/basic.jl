using PubSub: pub, subscribe, sendMessage

function listener1(arg1, arg2=nothing)
    println("Function listener1 received:")
    println("   arg1 =$arg1")
    println("   arg2 =$arg2")
end

# ------------ register listener ------------------

subscribe(pub, listener1, "rootTopic")

#---------------- send a message ------------------

println("Publish something via pubsub")
anObj = Dict(
    "a" => 456,
    "b" => "abc"
)

sendMessage(pub, "rootTopic") #; arg1=123, arg2=anObj)
