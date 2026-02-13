import 'package:flutter/material.dart';

class WorkersScreen extends StatefulWidget {
  const WorkersScreen({super.key});

  @override
  State<WorkersScreen> createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {
  String? selectedSite;

  final List<String> sites = [
    'Mabatini',
    'Mishi Mboko',
    'Huruma',
    'DCC Kibra',
    'Ngei',
    'Iremele',
  ];

  final List<List<String>> workers = [
    ["John Mitchell", "W001", "Skilled", "+1 555-0123", "Brickwork", "\$250"],
    ["Robert Chen", "W002", "Skilled", "+1 555-0124", "Carpentry", "\$280"],
    ["Maria Garcia", "W003", "Skilled", "+1 555-0125", "Electrical", "\$300"],
    ["David Thompson", "W004", "Skilled", "+1 555-0126", "Plumbing", "\$275"],
    ["Sarah Williams", "W005", "Unskilled", "+1 555-0127", "Labor", "\$150"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F6F8),
        title: const Row(
          children: [
            Icon(Icons.home_work_rounded, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              "Workers",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// SELECT SITE
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DropdownButtonFormField<String>(
                  value: selectedSite,
                  hint: const Text("Select Site"),
                  items: sites
                      .map(
                        (site) =>
                            DropdownMenuItem(value: site, child: Text(site)),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() => selectedSite = value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// STATS
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    title: "10",
                    subtitle: "Total Workers Assigned",
                    color: Colors.blue.shade100,
                    textColor: Colors.blue,
                    onTap: () => debugPrint("Total Workers"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    title: "8",
                    subtitle: "Workers Present Today",
                    color: Colors.orange.shade100,
                    textColor: Colors.orange,
                    onTap: () => debugPrint("Present Workers"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// ADD WORKER (DISABLED) + SEARCH
            Row(
              children: [
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    disabledBackgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Add Worker"),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    debugPrint("Search clicked");
                  },
                  icon: const Icon(Icons.search),
                  label: const Text("Search"),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// WORKER TABLE
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    showCheckboxColumn: false, // ✅ removes checkbox icons
                    headingRowColor: MaterialStateProperty.all(
                      Colors.grey.shade200,
                    ),
                    columnSpacing: 30,
                    columns: _buildHeaderColumns(),
                    rows: _buildWorkerRows(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CLICKABLE HEADER COLUMNS
  List<DataColumn> _buildHeaderColumns() {
    final headers = ["NAME", "ID", "TYPE", "PHONE NO", "TASK", "AMOUNT"];

    return headers.map((title) {
      return DataColumn(
        label: GestureDetector(
          onTap: () => debugPrint("Header clicked: $title"),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }

  /// CLICKABLE DATA CELLS (NO ROW CLICK)
  List<DataRow> _buildWorkerRows() {
    return workers.map((worker) {
      return DataRow(
        cells: worker.map((cell) {
          return DataCell(
            Text(cell),
            onTap: () {
              debugPrint("Cell clicked: $cell");
            },
          );
        }).toList(),
      );
    }).toList();
  }

  /// STAT CARD
  Widget _statCard({
    required String title,
    required String subtitle,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
