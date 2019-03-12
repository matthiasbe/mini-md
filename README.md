Vous serez par binôme. Chaque binôme doit :
1) choisir une miniapp dans la liste suivante (1 seul binôme pour une miniapp donnée)
2) la compiler (en release avec infos de debug) et trouver un dataset et des paramètres permettant une exécution comprise entre 20 secondes et 1 minute. Seul le CPU sera utilisé (pas d'accélération GPU)
3) mesurer les performances du code original (avec ses options de compilation par défaut) en variant le nombre de threads et analyser les bottlenecks séquentiels/parallèles
4) optimiser la compilation
5) analyser les performances, proposer des optimisations (et si possible les implémenter) sur le code source sans changement majeur de l'algo ou des structures de données
6) réfléchir à des changements plus profonds de l'algo ou des structures de données, surtout si vous n'avez pas obtenu une accélération significative (au moins 10%)
7) présenter (soutenance + rapport) votre travail :
7.1) domaine de la miniapp (hydrodynamique etc.) et en particulier ce que fait la miniapp dans ce domaine
7.2) bilan performance séquentielle et parallèle sur la version originale (en gros quelles sont les parties chaudes et pourquoi le sont elles, et comment ça évolue avec le nombre de threads)
7.3) optimisations réalisées et accélération obtenue. En cas d'accélération non significative, changements préconisés avec exemple sur quelques dizaines de lignes de codes représentatifs de ces changements." 
