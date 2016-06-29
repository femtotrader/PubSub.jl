module PubSub

    using DataStructures: OrderedDict, OrderedSet

    type MainPubSub
    end

    pub = MainPubSub()

    typealias Listener Function

    type Topic
        s::AbstractString
    end

    function Base.hash(topic::Topic)
        hash(topic.s)
    end

    function Base.isequal(topic1::Topic, topic2::Topic)
        topic1.s == topic2.s
    end


    type Proxy
        #d_listener::OrderedDict{AbstractString,Listener}
        #d_listener::OrderedDict{Topic,Listener}
        d_listener::OrderedDict{Topic,OrderedSet{Listener}}
        #d_queue::OrderedDict{Topic,Listener}
        Proxy() = new(OrderedDict())
    end

    proxy = Proxy()

    function subscribe(pub::MainPubSub, listener::Listener, topic::AbstractString)
        subscribe(pub::MainPubSub, listener::Listener, Topic(topic))
    end

    function subscribe(pub::MainPubSub, listener::Listener, topic::Topic)
        if !(haskey(proxy.d_listener, topic))
            proxy.d_listener[topic] = OrderedSet{Listener}()
        end
        push!(proxy.d_listener[topic], listener)
    end

    function sendMessage(pub::MainPubSub, topic::AbstractString, args...; kwargs...)
        sendMessage(pub, Topic(topic), args...; kwargs...)
    end

    function sendMessage(pub::MainPubSub, topic::Topic, args...; kwargs...)
        if haskey(proxy.d_listener, topic)
            for listener in proxy.d_listener[topic]
                println("$listener $args $kwargs")
                listener(args...; kwargs...)
            end
        end
    end

end # module
