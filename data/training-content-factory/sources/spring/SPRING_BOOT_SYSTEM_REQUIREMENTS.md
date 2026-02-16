
# Spring Boot — System Requirements (stable versions)

- track: spring
- type: reference
- language: en
- last_checked: 2026-02-16

URLs
- Spring Boot 4.0.2 System Requirements: https://docs.spring.io/spring-boot/system-requirements.html
- Spring Boot 3.5.10 System Requirements: https://docs.spring.io/spring-boot/3.5/system-requirements.html

핵심 포인트(교육 설계에서 버전 고정 판단)
- Boot 4.0.2: 최소 Java 17, Spring Framework 7.0.3+ (Tomcat 11.x, Servlet 6.1)
- Boot 3.5.10: 최소 Java 17, Spring Framework 6.2.15+ (Tomcat 10.1, Servlet 6.0)

교육 설계 메모
- 사내 프로젝트가 Tomcat 10/Servlet 6.0 계열이면 Boot 3.5 트랙을 기본으로.
- 신규(또는 Servlet 6.1/Tomcat 11)로 갈 수 있으면 Boot 4.0 트랙을 기본으로.
