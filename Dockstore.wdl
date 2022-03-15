version 1.0

workflow helloWorld {

    call sayHello

    String resultHello = sayHello.resultHello

    call sayWorld {
        input:
            resultHello = resultHello
    }

    String resultWorld = sayWorld.resultWorld

    call sayHelloWorld {
        input:
            resultWorld = resultWorld
    }
}

task sayHello {
    command {
        echo "current message is -> hello"
    }

    output {
        String resultHello = read_string(stdout())
    }

    runtime {
        docker: "ubuntu:18.04"
    }
}

task sayWorld {
    input {
        String resultHello
    }

    command {
        echo "previous message was -> ${resultHello}"
        echo "current message is -> world"
    }

    output {
        String resultWorld = read_string(stdout())
    }

    runtime {
        docker: "ubuntu:18.04"
    }
}

task sayHelloWorld {
    input {
        String resultWorld
    }

    command {
        echo "previous message was -> ${resultWorld}"
        echo "current message is -> hello world"
    }

    output {
        String out = read_string(stdout())
    }

    runtime {
        docker: "ubuntu:18.04"
    }
}
