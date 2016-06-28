module PubSub

    using DataStructures: OrderedDict, Queue

    type MainPubSub
    end

    pub = MainPubSub()

    typealias Listener Function

    type Topic
        s::AbstractString
    end

    type Proxy
        d::OrderedDict{Topic,Queue}
        Proxy() = new(OrderedDict())
    end

    proxy= Proxy()

    function subscribe(pub::MainPubSub, listener::Listener, topic::AbstractString)
        subscribe(pub::MainPubSub, listener::Listener, Topic(topic))
    end

    function subscribe(pub::MainPubSub, listener::Listener, topic::Topic)
        error("ToDo")
    end

    function sendMessage(pub::MainPubSub, topic::AbstractString; kwargs...)
        sendMessage(pub, Topic(topic); kwargs...)
    end

    function sendMessage(pub::MainPubSub, topic::Topic; kwargs...)
        error("ToDo")
    end

end # module
