workflow helloWorld {
    call sayHello
    call sayWorld
    call sayHelloWorld
}

task sayHello {
    command {
        echo "hello"
    }
    output {
        String out = read_string(stdout())
    }
    runtime {
        docker: "ubuntu:18.04"
    }
}

task sayWorld {
    command {
        echo "world"
    }
    output {
        String out = read_string(stdout())
    }
    runtime {
        docker: "ubuntu:18.04"
    }
}

task sayHelloWorld {
    command {
        echo "hello world"
    }
    output {
        String out = read_string(stdout())
    }
    runtime {
        docker: "ubuntu:18.04"
    }
}
