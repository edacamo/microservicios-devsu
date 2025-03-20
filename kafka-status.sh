#!/bin/bash

echo "🔍 Verificando estado de contenedores Kafka y Zookeeper..."
docker ps --filter name=kafka
docker ps --filter name=zookeeper

echo ""
echo "📦 Logs de Kafka (últimas 20 líneas):"
docker logs --tail 20 kafka

echo ""
echo "📦 Logs de Zookeeper (últimas 20 líneas):"
docker logs --tail 20 zookeeper

echo ""
echo "🔐 Listado de topics en Kafka:"
docker exec -it kafka kafka-topics --bootstrap-server localhost:9092 --list

echo ""
echo "🔍 Estado de Zookeeper:"
docker exec -it zookeeper bash -c "echo stat | nc localhost 2181"

echo ""
echo "💬 Brokers registrados en Kafka:"
docker exec -it kafka kafka-broker-api-versions --bootstrap-server localhost:9092

echo ""
echo "✅ Estado general listo."
