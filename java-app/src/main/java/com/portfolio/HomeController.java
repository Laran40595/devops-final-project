package com.portfolio;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {

        return """
        <h1>DevOps Final Project</h1>
        <h2>Java Spring Boot Application</h2>
        <p>Application is running successfully!</p>
        <ul>
            <li>Java 21</li>
            <li>Spring Boot</li>
            <li>Maven</li>
            <li>Docker</li>
            <li>Docker Compose</li>
            <li>Terraform</li>
            <li>Ansible</li>
            <li>Jenkins</li>
            <li>AWS EC2</li>
        </ul>
        """;
    }
}
