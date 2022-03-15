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
        echo "hello"
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
        echo "${resultHello} -> world"
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
        echo "${resultWorld} -> hello world"
    }

    output {
        String out = read_string(stdout())
    }

    runtime {
        docker: "ubuntu:18.04"
    }
}
