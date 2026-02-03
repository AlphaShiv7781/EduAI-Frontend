class IngestResult {
  final String status;
  final int chunksStored;
  final String embeddingType;

  IngestResult({
    required this.status,
    required this.chunksStored,
    required this.embeddingType,
  });

  factory IngestResult.fromJson(Map<String, dynamic> json) {
    return IngestResult(
      status: json['status'],
      chunksStored: json['chunks_stored'],
      embeddingType: json['embedding_type'],
    );
  }
}
